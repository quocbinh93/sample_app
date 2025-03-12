import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const messages = document.getElementById('messages')
  if (messages) {
    const roomId = messages.dataset.roomId

    consumer.subscriptions.create({ channel: "ChatChannel", room_id: roomId }, {
      connected() {
        console.log("Connected to chat room " + roomId)
      },

      disconnected() {
        // Called when subscription has been terminated
      },

      received(data) {
        if (data.action === 'delete') {
          const messageElement = document.getElementById(`message-${data.message_id}`)
          messageElement?.remove()
        } else if (data.message) {
          messages.insertAdjacentHTML('beforeend', data.message)
          messages.scrollTop = messages.scrollHeight
        }
      }
    })
  }
})

// Function để edit message
function editMessage(messageId) {
  const messageElement = document.getElementById(`message-${messageId}`)
  const contentElement = messageElement.querySelector('.message-content')
  const currentContent = contentElement.textContent.trim()
  
  const textarea = document.createElement('textarea')
  textarea.value = currentContent
  textarea.className = 'form-control'
  
  contentElement.innerHTML = ''
  contentElement.appendChild(textarea)
  
  textarea.focus()
  
  textarea.addEventListener('blur', () => {
    const newContent = textarea.value.trim()
    if (newContent !== currentContent) {
      updateMessage(messageId, newContent)
    } else {
      contentElement.innerHTML = currentContent
    }
  })
}

// Function để update message
function updateMessage(messageId, content) {
  const roomId = document.querySelector('.chat-container').dataset.roomId
  
  fetch(`/chat_rooms/${roomId}/messages/${messageId}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    },
    body: JSON.stringify({ message: { content } })
  })
};
