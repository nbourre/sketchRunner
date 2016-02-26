import java.io.*;

Runtime rt;
Process p;

int execAcc = 0;
int execInterval = 5000;
long previousTime = 0;
long currentTime = 0;

int index = 0;

ArrayList<SketchCommand> sketches;

void setup() {
  
  sketches = new ArrayList<SketchCommand>();
  
  sketches.add(new SketchCommand("attractor_01", "c:\\temp\\processing_projets\\", 60000));
  sketches.add(new SketchCommand("boids", "C:\\temp\\processing_projets\\", 60000));
  
  
  try {
    rt = Runtime.getRuntime();
    p = rt.exec(sketches.get(0).getCommand());
    
  } catch (Exception e) {
    println (e.getMessage());
  
  }

}

void draw() {
  currentTime = millis();
  execAcc += currentTime - previousTime;
  
  if (execAcc > execInterval) {
    execAcc = 0;
    
    if (sketches.size() > 1) {
      index = (index + 1) % sketches.size();
      
      p.destroy();
      
      try {
        SketchCommand current = sketches.get(index);
        execInterval = current.displayTime != 0 ? current.displayTime : 10000;
        p = rt.exec(sketches.get(index).getCommand());
      } catch (Exception e) {
        println (e.getMessage());
      }
    }
  }
  
  previousTime = currentTime;
}