# frozen_string_literal: true

require 'sidekiq-scheduler'

class AddMangaFromTruyenTranhTuan
  include Sidekiq::Worker
  require 'nokogiri'
  require 'open-uri'
  require 'watir'

  def perform
    doc = Nokogiri::HTML(URI.open('http://truyentranhtuan.com'))
    doc.css('.easy-tooltip a').first(20).each do |manga|
      manga_url = Nokogiri::HTML(URI.open(manga['href']))
      description = manga_url.css('#manga-summary p').text
      name = manga_url.css('h1')
      next if manga_url.at('p:contains("Chương mới nhất") a').nil?

      status = manga_url.at('p:contains("Chương mới nhất") a').text == 'Đang tiến hành' ? 'ongoing' : 'completed'
      author_name = manga_url.css("//span[@itemprop = 'author']//span").text
      author = Author.find_by_name(author_name)
      author ||= Author.new(name: author_name)
      author.save
      new_manga = Manga.find_by_name(name.text)
      new_manga ||= Manga.new(
        name: name.text,
        views_count: 0,
        author_id: author.id,
        description: description,
        status: status
      )
      new_manga.save
      get_cover(manga['href'], new_manga.id)
      get_categories(manga['href'], new_manga.id)
      get_chapter(manga['href'], new_manga.id)
    end
  end

  def get_cover(url, id)
    cover = Nokogiri::HTML(URI.open(url)).at('.manga-cover img')
    manga = Manga.find(id)
    return if cover.nil?
    return unless cover['src'] != ''

    downloaded_image = URI.open(cover['src'])
    manga.cover.attach(io: downloaded_image, filename: cover['src'])
  end

  def get_categories(url, id)
    Nokogiri::HTML(URI.open(url)).css("//a[@itemprop = 'genre']").each do |category|
      new_category = Category.find_by_name(category.text)
      new_category ||= Category.new(name: category.text)
      new_category.save
      MangaCategory.new(manga_id: id, category_id: new_category.id).save
    end
  end

  def get_chapter(url, id)
    Nokogiri::HTML(URI.open(url)).css('.chapter-name a').first(10).each do |chapter|
      new_chapter = Chapter.find_by_name(chapter.text)
      next unless new_chapter.nil?

      new_chapter = Chapter.new(name: chapter.text, manga_id: id)
      new_chapter.save
      browser = Watir::Browser.new :chrome, headless: true
      browser.goto chapter['href']
      browser.div(id: 'viewer').imgs.each do |img|
        url = URI.parse(img.src)
        url.scheme = 'http'
        url.to_s
        downloaded_image = URI.open(url.to_s)
        new_chapter.photos.attach(io: downloaded_image, filename: img.src)
      end
    end
  end
end
