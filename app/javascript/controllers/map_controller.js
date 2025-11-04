import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { tickets: Array }
  connect() {
    if(!this.ticketsValue || this.ticketsValue.length === 0){
      this.element.textContent = "No any data"
      return
    }

    const wkt = this.ticketsValue[0].well_known_text

    const pairs = wkt
      .replace('POLYGON((','')
      .replace('))', '')
      .split(',');

    const latlngs = pairs.map(pair => {
      const[lng, lat] = pair.trim().split(' ').map(Number)
      return[lat, lng]
    })

    this.map = L.map(this.element)

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(this.map);

     var polygon = L.polygon(latlngs, {color: 'blue', fillColor: '#2859ad', fillOpacity: 0.5})

     polygon.addTo(this.map)

     this.map.fitBounds(polygon.getBounds())
  }
}
