// script.js
const cards = document.querySelectorAll('.card');
const dislikeButtons = document.querySelectorAll('.dislike-btn');
const likeButtons = document.querySelectorAll('.like-btn');

let startX = 0;
let currentCard = null;

cards.forEach(card => {
    card.addEventListener('touchstart', touchStart);
    card.addEventListener('touchmove', touchMove);
    card.addEventListener('touchend', touchEnd);
});

dislikeButtons.forEach(button => {
    button.addEventListener('click', dislikeCard);
});

likeButtons.forEach(button => {
    button.addEventListener('click', likeCard);
});

function touchStart(e) {
    startX = e.touches[0].clientX;
    currentCard = this;
}

function touchMove(e) {
    const xDiff = e.touches[0].clientX - startX;
    currentCard.style.transform = `translateX(${xDiff}px)`;
}

function touchEnd(e) {
    const xDiff = e.changedTouches[0].clientX - startX;
    if (xDiff > 50) {
        // Swiped right
        currentCard.classList.add('swiped-right');
    } else if (xDiff < -50) {
        // Swiped left
        currentCard.classList.add('swiped-left');
    } else {
        // Reset card position
        currentCard.style.transform = 'translateX(0)';
    }
}

function dislikeCard() {
    const card = this.parentElement;
    card.classList.add('swiped-left');
}

function likeCard() {
    const card = this.parentElement;
    card.classList.add('swiped-right');
}
