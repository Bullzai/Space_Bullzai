// Holds button object data used in main menu
public class Button
{
  private int ID;
  private int xCoord;
  private int yCoord;
  private int xWidth;
  private int yHeight;
  public color colour = color(150, 150, 0);

  public Button() {
    xCoord = 0;
    yCoord = 0;
    xWidth = 100;
    yHeight = 50;
  }

  public Button(int xCoord, int yCoord, int xWidth, int yHeight) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.xWidth = xWidth;
    this.yHeight = yHeight;
  }

  public void drawButton() {
    fill(colour);
    rect(xCoord, yCoord, xWidth, yHeight);
  }

  // getter methods
  public int getID() {
    return ID;
  }

  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getXWidth() {
    return xWidth;
  }

  public int getYHeight() {
    return yHeight;
  }

  // setter methods
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  } 

  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  } 

  public void setXWidth(int xWidth) {
    this.xWidth = xWidth;
  }  

  public void setYHeight(int yHeight) {
    this.yHeight = yHeight;
  }  

  public void setID(int ID) {
    this.ID = ID;
  }
}
