// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("turbo:load", () => {
    const trigger = document.getElementById("userMenuTrigger");
    const menu = document.getElementById("dropdownMenu");

    if (!trigger || !menu) return;

    // クリックで開閉
    trigger.addEventListener("click", () => {
        menu.classList.toggle("active");
    });

    // 外クリックで閉じる
    document.addEventListener("click", (e) => {
        if (!trigger.contains(e.target) && !menu.contains(e.target)) {
            menu.classList.remove("active");
        }
    });
});