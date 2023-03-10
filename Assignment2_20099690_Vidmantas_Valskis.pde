import javax.swing.*;

byte bulletCounter = 0;
GamePlay gamePlay;

void setup() {
  size(800, 600);
  gamePlay = new GamePlay();
}

void draw() {
  background(0);
  if (gamePlay.UI.getDifficulty() == -1) {
    gamePlay.UI.drawMenu();
  } else {
    if (!gamePlay.player.isDifficultyApplied()) {       // set difficulty only once
      applyDifficulty();
    }
    gamePlay.initialize();                              // keep the main draw() as clean as possible
  }
}

void mousePressed() {
  for (Button button : gamePlay.UI.button) {
    if (gamePlay.collision(mouseX, mouseY, button.getXCoord(), button.getYCoord(), button.getXWidth(), button.getYHeight())) {
      gamePlay.UI.setDifficulty(button.getID());       // set difficulty
    }
  }
}

void mouseMoved() {
  for (Button button : gamePlay.UI.button) {
    if (gamePlay.collision(mouseX, mouseY, button.getXCoord(), button.getYCoord(), button.getXWidth(), button.getYHeight())) {
      button.colour = color(0, 85, 128);
    } else {
      button.colour = color(255, 255, 51);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT || key == 'a') {
    gamePlay.playerShip.move(-12);
  } else if (key == 'A') {
    gamePlay.playerShip.move(-18);
  } else if (keyCode == RIGHT || key == 'd') {
    gamePlay.playerShip.move(12);
  } else if (key == 'D') {
    gamePlay.playerShip.move(18);
  } else if (keyCode == UP || key == 'w') {
    if (bulletCounter < gamePlay.playerShip.bulletArray.length) {
      gamePlay.playerShip.shoot(bulletCounter);
      bulletCounter++;
    } else {
      bulletCounter = 0;
      gamePlay.playerShip.shoot(bulletCounter);
      bulletCounter++;
    }
  } else if (key == 'W') {
    if (bulletCounter < gamePlay.playerShip.bulletArray.length) {
      gamePlay.playerShip.shoot(bulletCounter, 5);
      bulletCounter++;
    } else {
      bulletCounter = 0;
      gamePlay.playerShip.shoot(bulletCounter, 5);
      bulletCounter++;
    }
  } else if (key == 'r') {
    gamePlay.tournamentOver(false);
    gamePlay = new GamePlay();                         // start new tournament
  } else if (keyCode == ESC) {
    gamePlay.tournamentOver(true);
  }
}

void applyDifficulty() {
  int i = 0;
  if (gamePlay.UI.getDifficulty() == 0) {
    while (i < gamePlay.enemyShip.length) {
      gamePlay.enemyShip[i].setXSpeed(2);
      i++;
    }
  } else if (gamePlay.UI.getDifficulty() == 1) {
    while (i < gamePlay.enemyShip.length) {
      gamePlay.enemyShip[i].setXSpeed(4);
      i++;
    }
  } else {
    while (i < gamePlay.enemyShip.length) {
      gamePlay.enemyShip[i].setXSpeed(8);
      i++;
    }
  }
  gamePlay.player.isDifficultyApplied(true);
}
