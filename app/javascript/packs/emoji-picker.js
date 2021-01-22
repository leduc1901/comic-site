import { EmojiButton } from '@joeattardi/emoji-button';

const picker = new EmojiButton();
const trigger = document.querySelector('#emoji-trigger');

picker.on('emoji', selection => {
  // handle the selected emoji here
  document.getElementById('comment-text').value += selection.emoji
});

trigger.addEventListener('click', () => picker.togglePicker(trigger));