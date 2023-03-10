// Holds player ship object & and its shot bullets info
public class Ship
{
  private int xCoord;
  private int yCoord;
  private int shipWidth;
  private int shipHeight;
  private Bullet bulletArray[] = new Bullet[6];

  public Ship() {
    xCoord = 0;
    yCoord = 0;
    shipWidth = 20;
    shipHeight = 20;
  }

  public Ship(int shipWidth, int shipHeight) {
    setShipWidth(shipWidth);
    setShipHeight(shipHeight);

    xCoord = width/2;
    yCoord = height - this.shipHeight;
  }

  // move player ship horizontally within boundaries
  public void move(int xCoord) {
    if (hitRightSide(xCoord)) {
      this.xCoord = width - shipWidth;
    } else if (hitLeftSide(xCoord)) {
      this.xCoord = 0;
    } else {
      this.xCoord = this.xCoord + xCoord;
    }
  }

  public boolean hitLeftSide(int xCoord) {
    if (this.xCoord + xCoord < 0) {
      return true;
    }  
    return false;
  }

  public boolean hitRightSide(int xCoord) {
    if (this.xCoord + shipWidth + xCoord > width) {
      return true;
    }
    return false;
  }

  // draw player ship
  public void display() {
    fill(50);
    noStroke();
    rect(xCoord, yCoord, shipWidth, shipHeight);
  }

  // shoot a pre-defined bullet
  public void shoot(byte bulletCounter) {
    bulletArray[bulletCounter] = new Bullet(xCoord + shipWidth/2 - 2, yCoord, 4, 10, 10);
  }

  // shoot a bullet with custom speed
  public void shoot(byte bulletCounter, int speed) {
    bulletArray[bulletCounter] = new Bullet(xCoord + shipWidth/2 - 2, yCoord, 4, 10, speed);
  }

  // getter methods
  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getShipWidth() {
    return shipWidth;
  }

  public int getShipHeight() {
    return shipHeight;
  }

  // setter methods
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }  

  public void setShipWidth(int shipWidth) {
    if ((shipWidth >= 10) && (shipWidth <= 50)) {
      this.shipWidth = shipWidth;
    } else {
      this.shipWidth = 20;
    }
  }  

  public void setShipHeight(int shipHeight) {
    if ((shipHeight >= 10) && (shipHeight <= 30)) {
      this.shipHeight = shipHeight;
    } else {
      this.shipHeight = 20;
    }
  }
}
