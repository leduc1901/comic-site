# frozen_string_literal: true

require 'administrate/base_dashboard'

class MangaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    chapters: Field::HasMany,
    manga_categories: Field::HasMany,
    comments: Field::HasMany,
    author: Field::BelongsTo,
    categories: Field::HasMany,
    cover: Field::ActiveStorage,
    id: Field::Number,
    views_count: Field::Number,
    status: Field::Select.with_options(searchable: false, collection: lambda do |field|
      field.resource.class.send(field.attribute.to_s.pluralize).keys
    end),
    user_id: Field::Number,
    banner_img: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    chapters
    categories
    comments
    author
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    chapters
    comments
    author
    categories
    cover
    id
    views_count
    status
    user_id
    banner_img
    description
    created_at
    updated_at
    name
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    chapters
    comments
    author
    categories
    cover
    views_count
    status
    user_id
    banner_img
    description
    name
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how mangas are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(manga)
  #   "Manga ##{manga.id}"
  # end
end
