// User interface to display important information
public class Interface
{
  private int difficulty = -1;
  Player player;
  Button button[] = new Button[3];

  public Interface() {
    player = new Player();
  }

  public Interface (Player player) {
    this.player = player;
    int i = 0;
    do {
      button[i] = new Button(width/2 - 250, i*100 + 100, 500, 100);
      i++;
    } while (i < 3);
  }

  // draw the main panel with most important info
  public void showPanel() {
    textSize(15);
    fill(255, 0, 0);
    if (player.getLives() == 3) {
      text("♥ ♥ ♥", 5, height - 95);
    } else if (player.lives == 2) {
      text("♥ ♥", 5, height - 95);
    } else if (player.lives == 1) {
      text("♥", 5, height - 95);
    } else {
      text("DEAD", 5, height - 95);
    }
    fill(50);
    text(player.getPlayerName(), 5, height - 80);
    fill(255);
    text("Round: " + player.getRound(), 5, height - 65);
    text("Score: " + player.getScore(), 5, height - 50);
    text("High Score: " + player.getHighScore(), 5, height - 35);
  }

  // draw the menu
  public void drawMenu() {
    textSize(47);
    fill(255);
    text("Choose your destinty:", width/2 - 250, 90);
    int i = 0;
    do {
      button[i].drawButton();
      button[i].setID(i);
      textSize(70);
      fill(0, 195, 195);
      if (button[i].getID() == 0) {
        text("easy", width/2 - 75, button[i].getYCoord() + button[i].getYHeight() - 20);
      } else if (button[i].getID() == 1) {
        text("normal", width/2 - 120, button[i].getYCoord() + button[i].getYHeight() - 20);
      } else {
        text("hard", width/2 - 75, button[i].getYCoord() + button[i].getYHeight() - 20);
      }
      i++;
    } while (i < 3);
  }

  // getter methods
  public int getDifficulty() {
    return difficulty;
  }

  // setter methods
  public void setDifficulty(int difficulty) {
    this.difficulty = difficulty;
  }
}
