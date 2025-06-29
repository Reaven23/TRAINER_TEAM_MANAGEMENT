import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["filter", "category", "filterLabel"]

  connect() {
    console.log("Skills controller connected")
  }

  filter(event) {
    const selectedCategory = event.currentTarget.dataset.category
    const selectedLabel = event.currentTarget.dataset.label

    // Mettre à jour les boutons actifs (desktop)
    this.filterTargets.forEach(button => {
      button.classList.remove('active')
    })
    event.currentTarget.classList.add('active')

    // Mettre à jour le label du dropdown (mobile)
    if (this.hasFilterLabelTarget) {
      this.filterLabelTarget.textContent = selectedLabel
    }

    // Filtrer les catégories
    this.categoryTargets.forEach(category => {
      if (selectedCategory === 'all' || category.dataset.category === selectedCategory) {
        category.style.display = 'block'
      } else {
        category.style.display = 'none'
      }
    })
  }
}
