# Agent skills

Every sub-folder of this folder is an agent skill: for example [git-worktree](./git-worktree/).

Every markdown file in this folder, except this README.md itself, is a _SubAgent_: for example [project-manager.md](./project-manager.md).

## Setup

Import utils.

```sh
#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh
```

Create _user level agent_ directories.

```sh
AGENTS_DIR=$HOME/.agents
CLAUDE_DIR=$HOME/.claude

AGENT_SKILLS_DIR=$AGENTS_DIR/skills/
mkdir -p $AGENT_SKILLS_DIR

CLAUDE_SKILLS_DIR=$CLAUDE_DIR/skills/
mkdir -p $CLAUDE_SKILLS_DIR

CLAUDE_SUBAGENTS_DIR=$CLAUDE_DIR/agents/
mkdir -p $CLAUDE_SUBAGENTS_DIR
```

### Install agent skills

For every agent skill folder, install it in the `AGENT_SKILLS_DIR`.

```sh

# Install skills

ls -1 $DIR | while read SKILL
	do
		test -d $DIR/$SKILL || continue
		SOURCE_DIR=$DIR/$SKILL
		TARGET_DIR=.agents/skills/$SKILL

		copy_file $SOURCE_DIR/SKILL.md $TARGET_DIR/SKILL.md

		if test -d $SOURCE_DIR/scripts
			then
				mkdir -p $HOME/$TARGET_DIR/scripts/
				ls -1 $SOURCE_DIR/scripts | while read FILE
					do
						copy_file $SOURCE_DIR/scripts/$FILE $TARGET_DIR/scripts/$FILE
					done
		fi
```

Finally link the skill folder to other agents skill folders.

```sh
		ln -sf $HOME/$TARGET_DIR $CLAUDE_SKILLS_DIR/$SKILL
	done
```

### Install sub-agents

For every sub-agents markdown file, copy and link it in the _user level agent dirs_.

```sh

# Install sub-agents

ls -1 $DIR | grep -v README.md | grep .md | while read FILE
	do
		copy_file $DIR/$FILE .agents/$FILE

		ln -sf $AGENTS_DIR/$FILE $CLAUDE_SUBAGENTS_DIR/$FILE
	done
```
