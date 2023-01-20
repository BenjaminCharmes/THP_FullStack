import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="emails"
export default class extends Controller {
  connect() {
  }

  showEmails(event) {
      event.preventDefault();
      const emailObject = event.params["object"];
      const emailBody = event.params["body"];
      const emailId = event.params["id"];
      let showEmailObject = document.getElementById("object").textContent = emailObject;
      let showEmailBody = document.getElementById("body").textContent = emailBody;
      let showDeleteBtn = document.getElementById("supp").textContent = emailId;
  }

}
