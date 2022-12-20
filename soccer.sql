

CREATE TABLE "Teams" (
    "TeamID" primarykey   NOT NULL,
    "Name" string   NOT NULL,
    "City" string   NOT NULL,
    "Mascot" string   NOT NULL
);

CREATE TABLE "Goals" (
    "GoalsId" primarykey   NOT NULL,
    "Game" integer   REFERENCES Matches (MatchID),
    "Player" integer   REFERENCES Players (PlayersID),
    "Team" integer   REFERENCES Teams (TeamID)
);

CREATE TABLE "Players" (
    "PlayersID" primarykey   NOT NULL,
    "FirstName" string   NOT NULL,
    "LastName" string   NOT NULL,
    "DOB" string   NOT NULL,
    "Team" int   REFERENCES Teams (TeamID),
    "Experience" int   NOT NULL
);

CREATE TABLE "Referees" (
    "RefID" primarykey   NOT NULL,
    "FirstName" string   NOT NULL,
    "LastName" string   NOT NULL,
    "GameReffed" int   REFERENCES Matches (MatchID)
);

CREATE TABLE "Matches" (
    "MatchID" primarykey   NOT NULL,
    "MatchDate" int,
    "HomeTeam" int   REFERENCES Teams (TeamID),
    "AwayTeam" int   REFERENCES Teams (TeamID),
    "HomeScore" int   NOT NULL,
    "AwayScore" int   NOT NULL,
    "Winner" Int  REFERENCES Teams (TeamID)
);

CREATE TABLE "Seasons" (
    "SeasonId" primarykey   NOT NULL,
    "StartDate" string   NOT NULL,
    "EndDate" string   NOT NULL,
    "Champion" int   REFERENCES Teams (TeamID),
);


