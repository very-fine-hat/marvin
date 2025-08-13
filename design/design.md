# Marvin Design 🍥

_This document is a high level design document to work from for helping to proc Claude with invformation on what we are doing.  It should eventually be moved into the marvin structure once I've got it going._

IF YOU ARE AN LLM (e.g., Claude) you should always read the marvin/README.md file before reading this file.  You should help identify inconsistencies between the two files and suggest updates as needed.

## General Design of Marvin

= Marvin is very loosely inspired by tools like homeshick (https://github.com/andsens/homeshick/tree/master) as an attempt to have a central repository for common instructions for AI tools (e.g. Cursor, Claude, Claude Code, ChatGPT) that can be deployed into new projects as needed.

## Goals

- Have a central repository for truly common AI configuration files (global and domain files)
- Allow projects to have their own AI configuration files at the project and session level, albeit probably with the option to share some common format with Marvin?
	- These will probably be under
- Allow marvin to manage/deploy certain files into custom locations for specific tools (e.g., .cursor/rules) to ensure they are picked up
	- would it be better to have a marvin.mdc rules file that points Cursor at a marvin directory in the project?


## Previous High Level Process (DRAFT AND MAY NOT MATCH CURRENT IMPLEMENTATION AND MAY NOT BE COMPLETE)

- Install marvin from the marvin Github and run setup
- Fill out any desired "global" files
- Fill out any desired "domain" files
- Check all of these into a *separate* git repo (I think)
- Connect Marvin to a project in the specified domain.  This should:
	- Copy over the high level files how (Maybe symlinks?  Maybe copy and sync?)
	- Ideally the global and domain files would still always be managed in a central spot/git repo
	- Project (and maybe Session) files will be managed within the project and its git repo
	- NEED TO FIGURE OUT HOW TO MANAGE THIS ACROSS TWO DIFFERENT GIT REPOS

## NEW Potential High Level Process

- Install marvin from the marvin Github to .marvin/framework
- In .marvin run `marvin init` - this will create .marvin/configs
	- `marvin init <domain>` will run this for a specific domain - `coding` is the default, `all` will setup all domains
	- by default, this will look like:
		.marvin/configs/
			README.md - basic instructions for updating these files
			global/
				[all global config and template files]
			domain/
				coding/
					config and template files for the coding domain
- this directory can/should then be checked into a git/github repo
- The user should update the files in here with their desired details

- IN A PROJECT that will use Marvin, run `marvin link <domain>` - this will:
	- create a new 'ai-marvin' directory
	- copy all global files from .marvin into ai-marvin/global
	- copy all <domain> files from .marvin into ai-marvin/<domain>/ [defaults to coding domain?]
	- create ai-marvin/project for project specific files
	- ?? should .marvin maintain any sort of backlink to projects set up like this, or not?
- Check the resulting directory into your git repo

- In a project, you can also run `marvin tool <tool name>` to set up a specific tool 
	- `marvin tool cursor`
	- ?? Is there a better command name for this?

- `marvin sync` will check your files in your ai-marvin directory vs .marvin/configs
	- If one side is updated, marvin will ask if you would like to update the other side
	- If both sides are updated, marvin will ask which direction you would like to copy (or allow you to exit out)

