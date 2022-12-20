
CREATE TABLE "Regions" (
    "RegionID" primarykey   NOT NULL,
    "Country" string   NOT NULL,
    "City" string   NOT NULL,
    "State_County" string   NOT NULL,
    "Timezopne" string   NULL
);

CREATE TABLE "Users" (
    "UserId" primarykey   NOT NULL,
    "Username" string   NOT NULL,
    "Password" string   NOT NULL,
    "PreferedRegion" integer REFERENCES Regions (RegionID)
);

CREATE TABLE "Posts" (
    "PostID" primarykey   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "User" int   integer REFERENCES Users (UserID),
    "Location" string   NOT NULL,
    "Region" int   integer REFERENCES Regions (RegionID),
    "Category" int   REFERENCES Categories (CatID)
);

CREATE TABLE "Categories" (
    "CatID" primarykey   NOT NULL,
    "Subject" string   NOT NULL,
    "Type" string   NOT NULL
);

