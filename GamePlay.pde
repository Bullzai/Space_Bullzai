/*  //<>//
 Main class to hold all the information & data.
 Has the most important methods and game mechanics with calculations
 */
public class GamePlay
{
  Enemy enemyShip[] = new Enemy[Integer.parseInt(JOptionPane.showInputDialog("Please enter the number of enemy ships you would like to play against: ", "20"))];
  Ship playerShip = new Ship(35, 25);
  Player player = new Player();
  Interface UI = new Interface(player);
  private int fleetSize = enemyShip.length;
  private int gamesPlayed = 1; 

  public GamePlay() {
    for (int i = 0; i < enemyShip.length; i++) {
      enemyShip[i] = new Enemy(10, 20, i * width/enemyShip.length);
    }
  }

  public void initialize() {
    UI.showPanel();                                        // draw the panel with useful info
    gameOverChecker();                                     // check if the game is over and ask the user if he wants to play another match
    playerShip.display();                                  // draw player ship

    // draw bullets
    for (int i = 0; i < playerShip.bulletArray.length; i++) {
      if (playerShip.bulletArray[i] != null) {
        if (!playerShip.bulletArray[i].getBulletCollided()) {
          playerShip.bulletArray[i].update();
          playerShip.bulletArray[i].display();
        }
      }
    }

    // draw enemy ships
    for (Enemy enemy : enemyShip) {
      enemy.update();
      enemy.display();

      // draw enemy bullets
      if (enemy.bullet != null) {
        enemy.bullet.update();
        enemy.bullet.display();
        // check enemy bullets collision with player ship
        if (collision(enemy.bullet.getXCoord(), enemy.bullet.getYCoord(), enemy.bullet.getWidth(), enemy.bullet.getHeight(), playerShip.getXCoord(), playerShip.getYCoord(), playerShip.getShipWidth(), playerShip.getShipHeight())) {
          enemy.bullet.kill();                            // "delete" the bullet by changing coords, since we can't use arrayList
          player.lostLive();                              // remove a life from the player
        }
      }

      // check player ship bullets collision with the enemy, while we are in the enemy ship drawing loop
      for (Bullet bullet : playerShip.bulletArray) {
        if (bullet != null) {
          if (collision(bullet.getXCoord(), bullet.getYCoord(), bullet.getWidth(), bullet.getHeight(), enemy.getXCoord(), enemy.getYCoord(), enemy.getEnemyWidth(), enemy.getEnemyHeight())) {
            enemy.shoot();                                // kamikaze type of backfiring on collision
            enemy.kill();                                 // "kill" the enemy ship by changing coords
            bullet.kill();                                // "delete" the bullet by changing coords
            player.addScore();                            // add a score for a "kill"
            if (player.getScore() % fleetSize == 0) {     // check if all enemy ships have been killed
              player.nextRound();                         // initialize new round
              deployFleet();                              // deploy new fleet of enemy ships when they're all killed
            }
          }
        }
      }
    }
  }

  // method to deploy a new fleet of enemy ships
  public void deployFleet() {
    for (int i = 0; i < enemyShip.length; i++) {
      enemyShip[i] = new Enemy(10, 20, i * width/enemyShip.length);
      if (gamePlay.UI.getDifficulty() == 0) {
        enemyShip[i].setXSpeed(2);
      } else if (gamePlay.UI.getDifficulty() == 1) {
        enemyShip[i].setXSpeed(4);
      } else {
        enemyShip[i].setXSpeed(8);
      }
    }
  }

  public void gameOverChecker() {
    if (player.getLives() == 0) {
      text("DEAD", 5, height - 80);
      int reply = JOptionPane.showConfirmDialog(null, 
        "You scored " + player.getScore() + " in " + player.getRound() + " rounds." + "\nWould you like to start a new match?", 
        "GAME OVER", 
        JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) {
        newGame();
      } else {
        tournamentOver(true);
      }
    }
  }

  public void newGame() {
    // local variables to hold in the score & high score data
    int score = player.getScore();
    int oldHighScore = player.getHighScore();
    String name = player.getPlayerName();
    boolean isHigher = false;

    //check if the player reached a new high score
    if (score > oldHighScore) {
      isHigher = true;
    } else {
      isHigher = false;
    }

    // initialize a new player
    player = new Player();

    // set the high score for the new game accordingly
    if (isHigher) {
      player.setHighScore(score);
      player.setBestPlayerName(name);
    } else {
      player.setHighScore(oldHighScore);
    }

    playerShip = new Ship(35, 25);
    UI = new Interface(player); 
    deployFleet();
    gamesPlayed++;
  }

  public void tournamentOver(boolean exit) {
    if (player.getBestPlayerName() == null) {                    // assign the correct data if only 1 game has been played
      player.setBestPlayerName(player.getPlayerName());
      player.setHighScore(player.getScore());
    } else if (player.getScore() > player.getHighScore()) {      // assign the correct data if the current game beat the high score
      player.setBestPlayerName(player.getPlayerName());
      player.setHighScore(player.getScore());
    }
    if (exit) {
      JOptionPane.showMessageDialog(null, "This tournament is over! \n\n"
        + "Winner is: " + player.getBestPlayerName()
        + "\nWith the highest score of: " + player.getHighScore()
        + "\nGames played: " + gamesPlayed
        + "\n\nPress OK to exit the Game");
      exit();
    } else {
      JOptionPane.showMessageDialog(null, "This tournament is over! \n\n"
        + "Winner is: " + player.getBestPlayerName()
        + "\nWith the highest score of: " + player.getHighScore()
        + "\nGames played: " + gamesPlayed
        + "\n\nPress OK to start a New Tournament");
    }
  } 

  // collision method for checking rectangle with rectangle
  public boolean collision(float rect1X, float rect1Y, float rect1Width, float rect1Height, float rect2X, float rect2Y, float rect2Width, float rect2Height) {
    if (rect1X + rect1Width >= rect2X &&    // rectangle-1 right edge past rectangle-2 left
      rect1X <= rect2X + rect2Width &&      // rectangle-1 left edge past rectangle-2 right
      rect1Y + rect1Height >= rect2Y &&     // rectangle-1 top edge past rectangle-2 bottom
      rect1Y <= rect2Y + rect2Height) {     // rectangle-1 bottom edge past rectangle-2 top
      return true;
    }
    return false;
  }

  // overloaded collosion method for checking point with rectangle (used for menu detection)
  public boolean collision(float pointX, float pointY, float rectX, float rectY, float rectWidth, float rectHeight) {
    if (pointX >= rectX &&
      pointX <= rectX + rectWidth &&
      pointY >= rectY &&
      pointY <= rectY + rectHeight) {
      return true;
    }
    return false;
  }

  // getter methods
  public int getFleetSize() {
    return fleetSize;
  }

  public int getGamesPlayed() {
    return gamesPlayed;
  }

  // setter methods
  public void setFleetSize(int fleetSize) {
    this.fleetSize = fleetSize;
  }

  public void setGamesPlayed(int gamesPlayed) {
    this.gamesPlayed = gamesPlayed;
  }
}
