float xBall; // Balls x-coordinate
float yBall; // Balls y-co-ordinate
float onexRect; // Rectangle 1 x co-ordinate
float oneyRect; // Rectangle 1 y co-ordinate
float twoxRect; // Rectangle 2 x co-ordinate
float twoyRect; // Rectangle 2 y co-ordinate
float onewRect; // Rectangle one width
float onehRect; // Rectangle one height
float twowRect; // Rectangle two width
float twohRect; //Rectangle two height
int score; // Score Variable
float Speedx; // Horizontal speed
float Speedy; // Vertical Speed
float tSize; // Text size 
float diameter; // Circle diameter
int score1; // Score 1 Variable
int score2; // Score 2 Variable // Send code to s.boateng@kidsandmaths.org
float scorePlace;

void setup ()
{
  fullScreen(); //Instructions for Android and PC

  xBall = width/2; //Ball x co-ordinate
  yBall = height/2; //Ball y co-ordinate
  onexRect = 0; //Rectangle one x-co-ordinate value
  oneyRect = 0; //Rectangle one y-co-ordinate value
  onewRect = width/50; // Rectangle one width
  onehRect = height/5; // Rectangle one height
  twoxRect = 49*width/50; // Rectangle two x-co-ordinate
  twoyRect = 4*height/5; // Rectangle two y-co-ordinate
  twowRect = 49*width/50; //Rectangle two width
  twohRect = 1*height/5; //Rectangle two height
  score1 = 0; // Player 1 score
  score2 = 0; // Player 2 score
  Speedx = 10 ; // Horizontal Ball Speed
  Speedy = 10 ; //Vertical Ball Speed
  tSize = 30; // Text Size
  diameter = 20; // Diameter of circle
  scorePlace = height/2;
}

void draw ()
{
  placement();
  playerScores();
  wallCheck();
  movePaddle();
  leftPaddle();
  rightPaddle();
}

void placement ()
{
  background (0);
  fill(255); //Paints ball white
  ellipse (xBall, yBall, diameter, diameter); // Draws the ball
  fill(0, 255, 0); // Paints ball green
  rect (onexRect, oneyRect, onewRect, onehRect); //Rectangle One
  rect (twoxRect, twoyRect, twowRect, twohRect); // Rectangle Two

  textSize (tSize); // Text Size
  text (score1, 2*width/6, scorePlace);//Score 1
  text (score2, 4*width/6, scorePlace);// Score 2

 xBall = xBall + Speedx;
 yBall = yBall + Speedy;
 
}

  void playerScores() //Displays player scores
  {
   if (xBall + diameter/2 > width )
    {
      text("Player 1 Scores", 2*width/6, height/3);
      score1 += 1;
      xBall = width/2;
      yBall = height/2;
    } 
   else if  (xBall - diameter/2 < 0)
    {
      text("Player 2 Scores", 4*width/6, height/3);
      score2 += 1;

      xBall = width/2;
      yBall = height/2;
    }
  }


void wallCheck()//Checks horizontal walls at the edges
{
  if (yBall + diameter/2 >= height || yBall - diameter/2 <= 0)
  {
    Speedy = Speedy * -1;
  }
}


void movePaddle () //Moves the paddle
{
  if (mouseX < width/2)
  {
    oneyRect = mouseY;
    if (oneyRect + onehRect > height)
    {
      oneyRect = height - onehRect;
    }
  } 
 else if (mouseX > width/2)
  {
    twoyRect = mouseY;
    if (twoyRect + twohRect > height)

    {
      twoyRect = height - twohRect;
    }
  }
}


void leftPaddle() //Checks left paddle
{
  if ((xBall - diameter/2 <= onexRect + onewRect) && (Speedx < 0) && (yBall >= oneyRect) && (yBall <= oneyRect + onehRect))
  {
    Speedx *= -1;
  }
}

void rightPaddle() //Checks right paddle
{
  if ((xBall + diameter/2 >= twoxRect ) && (Speedx > 0) && (yBall >= twoyRect) && (yBall <= twoyRect + onehRect)) 
  {
    Speedx *= -1;
  }
}