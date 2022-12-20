
CREATE TABLE "Doctors" (
    "DoctorID" PRIMARY KEY,
    "FirstName" string  ,
    "LastName" string   ,
    "Specialty" string,
    "Experience" integer  
);

CREATE TABLE "Patient" (
    "PatientId" PRIMARY KEY,
    "FirstName" string   ,
    "LastName" string   ,
    "Disease" integer REFERENCES Diseases (DiseaseID),
    "DoctorAssigned" integer REFERENCES Doctors (DoctorID)   
);

CREATE TABLE "Diseases" (
    "DiseaseID" PRIMARY KEY,
    "Name" string   ,
    "Type" string   ,
    "Treatment" string
);

