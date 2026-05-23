-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/
require "vars.keys"
require "vars.programs"

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
require "config.env"

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-------------------
---- AUTOSTART ----
-------------------
require "config.events"

------------------
---- MONITORS ----
------------------
require "config.monitor"

-----------------------
----- PERMISSIONS -----
-----------------------
require "config.perms"

-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
require "config.general"
require "config.animations"

---------------
---- INPUT ----
---------------
require "config.input"

---------------------
---- KEYBINDINGS ----
---------------------
require "config.binds.navigation"
require "config.binds.applications"
require "config.binds.spaces"
require "config.binds.peek_workspaces"
require "config.binds.win"
require "config.binds.extras"

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
require "config.rules.window"
require "config.rules.workspace"
require "config.rules.layer"
