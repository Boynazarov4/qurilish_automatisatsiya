fetch("../api/get_projects.php")
    .then(response => response.json())
    .then(data => {
        let container = document.getElementById("projects");
        data.forEach(project => {
            let item = document.createElement("li");
            item.innerHTML = `<strong>${project.name}</strong> - ${project.status}`;
            container.appendChild(item);
        });
    });

document.getElementById("addProjectForm").addEventListener("submit", function(event) {
    event.preventDefault();
    let formData = new FormData(this);

    fetch("../api/add_project.php", {
        method: "POST",
        body: formData
    }).then(response => response.text())
      .then(data => alert(data));
});
