import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["btn"];

  toggle(e) {
    e.preventDefault();
    console.log(this.btnTarget);
    const { id } = this.element.dataset;
    const url = `/api/v1/products/${id}/like`;
    const token = document.querySelector("meta[name='csrf-token']").content;


    
    fetch (url, {
      method: "PATCH",
      headers: { "X-CSRF-Token" : token },
    })
    .then((result) => {
      return result.json();
    })
    .then (({ status }) =>{
      if (status == "liked"){
        this.btnTarget.textContent = "取消";
      }else {
        this.btnTarget.textContent = "喜歡";
      }
    })
    .catch((err)=>{
      console.log(err);
    })
  }
}
