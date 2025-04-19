# [The 20 Games Challenge](https://20_games_challenge.gitlab.io/)

Just some gamedev training for myself :)  
I might write a devlog in the future or not.

Pressing `Esc` toggles the game menu and pressing `Tab` in a game toggles the game menu (if one exists)

## Game list

1. [Pong](#game-1-pång-pong)
2. [Jetpack joyride](#game-2-jetpack-joyride)
3. [Global todo](#global-todo)

## Game 1: PÅNG (PONG)

### Controls

| Button       | Action            |
| ------------ | ----------------- |
| <kbd>W</kbd> | Left paddle up    |
| <kbd>S</kbd> | Left paddle down  |
| <kbd>-</kbd> | Right paddle up   |
| <kbd>-</kbd> | Right paddle down |

### TODO

- [ ] Two player controls
- Currently <kbd>W</kbd> and <kbd>S</kbd> control both paddles at once. Adding controls for second player is trivial, but I'm lazy :smile:
- [ ] Single player AI

## Game 2: Jetpack joyride

### Controls

| Button           | Action  |
| ---------------- | ------- |
| <kbd>Space</kbd> | Move up |

### TODO

- [ ] Create a more robust MovementController
- [ ] Add obstacles
- [ ] Add enemies
- [ ] Add a component for hitboxes and hurtboxes

### Devlog

Early on I decided to try and make my life as hard as possible by trying to create as much of the functionalities by
myself as possible. Now I've been trying to figure out how to create a "simple" yet extendable implementation of moving and colliding.
This has been going on for multiple days now and I've been pingpongin between using CharacterBody2D and rolling up my own system. I've
rewritten the movement logic so many times by now that I'll just have to commit something. I can't stand to look at the `new file`
tag git keeps giving me...

## Global todo

- [ ] Rebindable keys
