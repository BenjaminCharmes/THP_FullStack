<h1 align="center">Day 24 of The Hacking Project: OOP of Champions: tic-tac-toe !</h1>

You will do some sites that will train you with relational databases

For this project, we will ask you to create models for several applications. These will be your first advanced tables, but at your level there is no stopping you.

For all these sites, we are going to ask you to create only the models, no views / controller. ✌️

<h2 align="center">🎉 Week 2: Day 4 of the FullStack training 🎉</h2>

<div align="center">
  
  [⬅️ - Back to Day 3️⃣](https://github.com/BenjaminCharmes/THP_FullStack/tree/main/Week_2/Day_3)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  [Go to Day 5️⃣ - ➡️](https://github.com/BenjaminCharmes/THP_FullStack/tree/main/Week_2/Day_5)

</div>

<div align="center">

  [🔙 - Back to week 2️⃣](https://github.com/BenjaminCharmes/THP_FullStack/tree/main/Week_2)

  [🔙 - Back to home page](https://github.com/BenjaminCharmes/THP_FullStack)

</div>

### Models & Tables

- `Doctors` 
  - `first_name`
  - `last_name`
  - `zip_code`

- `Specialties` 
  - `specialty`

- `DoctorSpecialties` 

1. A `doctor` would have several `specialties` (DEAL_WITH_IT), and a `specialty` could involve several `doctors`.

- `Patients`
  - `first_name`
  - `last_name`

- `Appointments`
  - `date`

1. An `appointment` can only have one `doctor`, but a `doctor` can have several `appointments`.

2. An `appointment` can only have one `patient`, but a `patient` can have several `appointments`.

3. A `doctor` can have several `patient`s, through `appointments`, and vice versa.

- `Cities`
  - `name`

1. A `city` can have several `doctors`, `patients`, and `appointments`.