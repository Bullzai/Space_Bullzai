// hold enemy ship & its bullet info
public class Enemy
{
  private int xCoord;
  private int yCoord;
  private int enemyWidth;
  private int enemyHeight;
  private int xSpeed;
  private boolean enemyKilled = false;
  private Bullet bullet;

  public Enemy() {
    xCoord = 0;
    yCoord = 0;
    enemyWidth = 20;
    enemyHeight = 20;
    xSpeed = 10;
  }

  public Enemy(int enemyWidth, int enemyHeight, int xCoord) {
    setEnemyWidth(enemyWidth);
    setEnemyHeight(enemyHeight);

    this.xCoord = xCoord;
    this.yCoord = 0;
  }

  public void shoot() {
    bullet = new Bullet(xCoord + enemyWidth/2 - 2, yCoord, 4, 10, -10);
  }

  public void update() {
    xCoord = xCoord + xSpeed;

    if (xCoord > width - enemyWidth) {
      xCoord = width - enemyWidth;
      xSpeed = xSpeed * -1;
      yCoord = height/2;
    } else if (xCoord < 0) {
      xCoord = 0;
      xSpeed = xSpeed * -1;
      yCoord = 0;
    }
  }

  public void display() {
    if (!enemyKilled) {
      fill(255, 255, 0);
      noStroke();
      rect(xCoord, yCoord, enemyWidth, enemyHeight);
    }
  }

  // 'kill' the enemy by changing it's coordinates
  public void kill() {
    xCoord = width + 50;
    yCoord = height - 50;
    xSpeed = 0;
    enemyKilled = true;
  }

  //getter methods
  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getEnemyWidth() {
    return enemyWidth;
  }

  public int getEnemyHeight() {
    return enemyHeight;
  }

  public int getXSpeed() {
    return xSpeed;
  }

  public boolean getEnemyKilled() {
    return enemyKilled;
  }

  //setter methods
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  } 

  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  } 

  public void setEnemyWidth(int enemyWidth) {
    if ((enemyWidth >= 20) && (enemyWidth <= width/2)) {
      this.enemyWidth = enemyWidth;
    } else {
      this.enemyWidth = 20;
    }
  }  

  public void setEnemyHeight(int enemyHeight) {
    if ((enemyHeight >= 20) && (enemyHeight <= height/2)) {
      this.enemyHeight = enemyHeight;
    } else {
      this.enemyHeight = 20;
    }
  }

  public void setXSpeed(int xSpeed) {
    if ((xSpeed >= -20) && (xSpeed <= 20)) {
      this.xSpeed = xSpeed;
    } else {
      this.xSpeed = 2;
    }
  }

  public void setEnemyKilled(boolean enemyKilled) {
    this.enemyKilled = enemyKilled;
  }
}
