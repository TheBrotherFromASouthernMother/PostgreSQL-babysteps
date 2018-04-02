--
-- -- What are all projects that use JavaScript?
-- SELECT * FROM project JOIN project_uses_tech ON project_uses_tech.project_id = project.id JOIN tech ON project_uses_tech.tech_id = tech.id AND tech_id = 1;
-- --Answer: there are none;
--
-- --What are all technologies used by the Personal Website?
-- SELECT * FROM project JOIN project_uses_tech ON project_uses_tech.project_id = project.id JOIN tech ON project_uses_tech.tech_id = tech.id WHERE project.id = 4;
-- --Answer: HTML and CSS

-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
-- SELECT * FROM tech LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id;
--Answer: Ruby, JavaScript, Java.


--Based on the previous query, get the count of the number of techs used by each project.
 -- SELECT name, COUNT(project_uses_tech.project_id) FROM tech LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id GROUP BY name;



 --Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
 -- SELECT * FROM project LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id;
 --Anwer: whiteboard exercises


--Based on the previous query, get the count of the number of projects that use each tech.
-- SELECT name, COUNT(project_uses_tech.project_id) FROM project LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id GROUP BY name;


--List all projects along with each technology used by it. You will need to do a three-way join.
-- SELECT * FROM project JOIN project_uses_tech ON project_uses_tech.project_id = project.id JOIN tech ON project_uses_tech.tech_id = tech.id;


--List all the distinct techs that are used by at least one project.
-- SELECT * FROM project JOIN project_uses_tech ON project_uses_tech.project_id = project.id JOIN tech ON project_uses_tech.tech_id = tech.id WHERE project.name = 'RPG Hero Game' OR project.name = 'Mozilla Front Page';


--List all the distinct techs that are not used by any projects
-- SELECT * FROM tech LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id WHERE project_id IS NULL;

--List all the distinct projects that use at least one tech.
-- SELECT * FROM tech LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id WHERE project_id IS NOT NULL;


--List all the distinct projects that use no tech.
-- SELECT * FROM project LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id WHERE tech_id IS NULL;

--Order the projects by how many tech it uses.
-- SELECT name, COUNT(project_uses_tech.project_id) AS num_tech FROM project LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id GROUP BY name ORDER BY num_tech;

--Order the tech by how many projects use it.
-- SELECT name, COUNT(project_uses_tech.project_id) AS num_projects FROM tech LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id GROUP BY name ORDER BY num_projects;
