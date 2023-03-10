// Holds player info
public class Player
{
  private int lives = 3;
  private int round = 1;
  private int score = 0;
  private int highScore = 0;
  private boolean isDifficultyApplied = false;
  private String playerName = (JOptionPane.showInputDialog("Enter the player name (max 8 chars): "));
  private String bestPlayerName;

  public Player() {
    setPlayerName(playerName);
  }

  public Player(int lives) {
    setPlayerName(playerName);
    this.lives = lives;
  }

  public void addScore() {
    score++;
  }

  public void nextRound() {
    round++;
  }

  public void lostLive() {
    lives--;
  }

  // getter methods
  public int getScore() {
    return score;
  }

  public int getRound() {
    return round;
  }

  public int getLives() {
    return lives;
  }

  public int getHighScore() {
    return highScore;
  }

  public boolean isDifficultyApplied() {
    return isDifficultyApplied;
  }

  public String getPlayerName() {
    return playerName;
  }

  public String getBestPlayerName() {
    return bestPlayerName;
  }

  // setter methods
  public void setLives(int lives) {
    this.lives = lives;
  }

  public void setRound(int round) {
    this.round = round;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public void setHighScore(int highScore) {
    this.highScore = highScore;
  }

  public void isDifficultyApplied(boolean isDifficultyApplied) {
    this.isDifficultyApplied = isDifficultyApplied;
  }

  public void setPlayerName(String playerName) {
    if (playerName.length() > 8) {
      this.playerName = playerName.substring(0, 8);
    } else {
      this.playerName = playerName;
    }
  }

  public void setBestPlayerName(String bestPlayerName) {
    if (bestPlayerName.length() > 8) {
      this.bestPlayerName = bestPlayerName.substring(0, 8);
    } else {
      this.bestPlayerName = bestPlayerName;
    }
  }
}
