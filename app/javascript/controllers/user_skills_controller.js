import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["filter", "category"]

  connect() {
    console.log("User skills controller connected")
  }

  filter(event) {
    const selectedCategory = event.currentTarget.dataset.category

    // Mettre à jour les boutons actifs
    this.filterTargets.forEach(button => {
      button.classList.remove('active')
    })
    event.currentTarget.classList.add('active')

    // Filtrer les catégories
    this.categoryTargets.forEach(category => {
      if (selectedCategory === 'all' || category.dataset.category === selectedCategory) {
        category.style.display = 'block'
      } else {
        category.style.display = 'none'
      }
    })
  }

  updateStatus(event) {
    event.preventDefault()
    const form = event.target.closest('form')
    const formData = new FormData(form)
    const oldStatus = this.getCurrentStatus(event.target)
    const newStatus = formData.get('user_skill[status]')

    fetch(form.action, {
      method: form.method,
      body: formData,
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === 'success') {
        // Mettre à jour le badge
        this.updateBadge(event.target, newStatus)
        // Mettre à jour les statistiques
        this.updateStatistics(oldStatus, newStatus)
      } else {
        console.error('Erreur:', data.message)
      }
    })
    .catch(error => {
      console.error('Erreur:', error)
    })
  }

  updateBadge(select, status) {
    const listItem = select.closest('.list-group-item')
    let badge = listItem.querySelector('.badge')

    if (!badge) {
      badge = document.createElement('span')
      badge.className = 'badge ms-2'
      listItem.querySelector('.skill-name').after(badge)
    }

    // Mettre à jour le badge selon le statut
    badge.className = `badge ms-2 ${this.getBadgeClass(status)}`
    badge.textContent = this.getStatusLabel(status)
  }

  updateStatistics(oldStatus, newStatus) {
    // Trouver les éléments de statistiques
    const acquiredCard = document.querySelector('.card h3.text-success')
    const inProgressCard = document.querySelector('.card h3.text-warning')
    const notAcquiredCard = document.querySelector('.card h3.text-danger')
    const totalCard = document.querySelector('.card h3.text-info')

    if (acquiredCard && inProgressCard && notAcquiredCard && totalCard) {
      let acquiredCount = parseInt(acquiredCard.textContent)
      let inProgressCount = parseInt(inProgressCard.textContent)
      let notAcquiredCount = parseInt(notAcquiredCard.textContent)
      let totalCount = parseInt(totalCard.textContent.split('/')[0])

      // Décrémenter l'ancien statut
      if (oldStatus) {
        switch(oldStatus) {
          case 'Acquis':
            acquiredCount--
            break
          case 'En_Progrès':
            inProgressCount--
            break
          case 'Non_Acquis':
            notAcquiredCount--
            break
        }
      } else {
        // Si pas d'ancien statut, c'était "Non acquise" par défaut
        notAcquiredCount--
      }

      // Incrémenter le nouveau statut
      switch(newStatus) {
        case 'Acquis':
          acquiredCount++
          break
        case 'En_Progrès':
          inProgressCount++
          break
        case 'Non_Acquis':
          notAcquiredCount++
          break
      }

      // Mettre à jour l'affichage
      acquiredCard.textContent = acquiredCount
      inProgressCard.textContent = inProgressCount
      notAcquiredCard.textContent = notAcquiredCount
      totalCard.textContent = `${totalCount}/${totalCard.textContent.split('/')[1]}`
    }
  }

  getCurrentStatus(select) {
    const listItem = select.closest('.list-group-item')
    const badge = listItem.querySelector('.badge')
    if (badge) {
      const badgeText = badge.textContent
      switch(badgeText) {
        case 'Acquise': return 'Acquis'
        case 'En cours': return 'En_Progrès'
        case 'Non acquise': return 'Non_Acquis'
        default: return null
      }
    }
    return null
  }

  getBadgeClass(status) {
    switch(status) {
      case 'Acquis': return 'bg-success'
      case 'En_Progrès': return 'bg-warning'
      case 'Non_Acquis': return 'bg-danger'
      default: return 'bg-secondary'
    }
  }

  getStatusLabel(status) {
    switch(status) {
      case 'Acquis': return 'Acquise'
      case 'En_Progrès': return 'En cours'
      case 'Non_Acquis': return 'Non acquise'
      default: return status
    }
  }
}
