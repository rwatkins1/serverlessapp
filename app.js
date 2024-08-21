// Add your API endpoint here
var API_ENDPOINT = "https://zuk6ku3zlb.execute-api.us-east-1.amazonaws.com/prod";

// Save student data via a POST request
document.getElementById("registration-form").addEventListener('submit', function(event){
    event.preventDefault();

    var inputData = {
        "student_id": document.getElementById('student_id').value,
        "name": document.getElementById('student-name').value,
        "class": document.getElementById('student_class').value,
        "age": document.getElementById('student-age').value
    };

    fetch(API_ENDPOINT, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById("studentSaved").innerHTML = "Student Data Saved!";
    })
    .catch(error => {
        alert("Error saving student data.");
        console.error('Error:', error);
    });

    // Clear the form after submission
    document.getElementById("registration-form").reset();
});

// Retrieve all students via a GET request
document.getElementById("view-students-btn").addEventListener('click', function(){  
    fetch(API_ENDPOINT, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        var studentsList = document.getElementById('students-list');
        studentsList.innerHTML = ''; // Clear previous entries

        data.forEach(function(student) {
            var li = document.createElement('li');
            li.textContent = `${student.student_id}: ${student.name}, Age: ${student.age}, Class: ${student.class}`;
            studentsList.appendChild(li);
        });
    })
    .catch(error => {
        alert("Error retrieving student data.");
        console.error('Error:', error);
    });
});
