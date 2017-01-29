void setup() {
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
}

int score = 0;
int it = 0;

void loop() {
  int time = 1000;
  int i = 0;
  long int num = millis();
  
  num = num % 5;
  num += 2;
  
  while(i < time) {
    digitalWrite(num, HIGH);
    if(digitalRead(num + 5)) {
        score++;
        break;
    }
    i++;
    delay(1);
  }
  
  digitalWrite(num , LOW);
  delay(time/4);
}
