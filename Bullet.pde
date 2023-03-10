// Holds basic bullet object info
public class Bullet
{
  private float xCoord;
  private float yCoord;
  private float bulletWidth;
  private float bulletHeight;
  private float speedY;
  private boolean bulletCollided = false;

  public Bullet() {
    xCoord = 0;
    yCoord = 0;
    bulletWidth = 2;
    bulletHeight = 5;
    speedY = 10;
  }

  public Bullet(float xCoord, float yCoord, float bulletWidth, float bulletHeight, float speedY) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.bulletWidth = bulletWidth;
    this.bulletHeight = bulletHeight;
    setSpeedY(speedY);
  }

  public void update() {
    yCoord = yCoord - speedY;
  }

  //Draw the ball on the display window
  public void display() {
    fill(255, 0, 0);
    noStroke();
    rect(xCoord, yCoord, bulletWidth, bulletHeight);
  }

  // 'kill' the bullet by changing its coordinates to be out of the games window
  public void kill() {
    bulletCollided = true;
    xCoord = -10; 
    yCoord = -10;
  }

  // getter methods
  public float getXCoord() {
    return xCoord;
  }  

  public float getYCoord() {
    return yCoord;
  }  

  public float getWidth() {
    return bulletWidth;
  }  

  public float getHeight() {
    return bulletHeight;
  }  

  public float getSpeedY() {
    return speedY;
  }  

  public boolean getBulletCollided() {
    return bulletCollided;
  }  

  // setter methods
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }

  public void setBulletWidth(int bulletWidth) {
    this.bulletWidth = bulletWidth;
  }  

  public void setBulletHeight(int bulletHeight) {
    this.bulletHeight = bulletHeight;
  }

  public void setSpeedY(float speedY) {
    if (speedY <= 20) {
      this.speedY = speedY;
    } else {
      this.speedY = 10;
    }
  }

  public void setBulletCollided(boolean bulletCollided) {
    if ((bulletCollided == true) || (bulletCollided == false)) {
      this.bulletCollided = bulletCollided;
    } else {
      this.bulletCollided = false;
    }
  }
}
