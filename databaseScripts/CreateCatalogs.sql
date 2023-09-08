-- Create the Project table
CREATE TABLE Project (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(246) NOT NULL
);

-- Create the Module table
CREATE TABLE Module (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(246) NOT NULL
);