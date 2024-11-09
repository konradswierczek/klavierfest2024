document.addEventListener('DOMContentLoaded', () => {
    const buzzwords = document.querySelectorAll('#buzzwords .buzzword');
    buzzwords.forEach(buzzword => {
      setInterval(() => {
        // Random position within viewport
        const x = Math.floor(Math.random() * 90); // Percentages to stay within bounds
        const y = Math.floor(Math.random() * 80);
  
        // Apply random position and toggle visibility
        buzzword.style.top = `${y}vh`;
        buzzword.style.left = `${x}vw`;
        buzzword.classList.toggle('visible');
      }, Math.random() * 2000 + 1000); // Random interval between 1-3 seconds
    });
  });