class SketchCommand {
  
  String name;
  String folder;
  String nameJar;
  
  int displayTime = 0; // When cycling through multiple sketch we can put an interval 
  
  public SketchCommand(String name, String folder) {
    this.setName(name);
    this.folder = folder;
  }
  
  public SketchCommand(String name, String folder, int displayTime) {
    this.setName(name);
    this.folder = folder;
    this.displayTime = displayTime;
  }
  
  public void setName(String name) {
    if (name.contains(".jar")) {
      nameJar = name;
      this.name = name.replace(".jar", "");
    } else {
      this.nameJar = name + ".jar";
      this.name = name;
    }
  }
  
  public String getCommand() {
    return "java -cp " + folder + nameJar + ";" + folder + "core.jar " + name;    
  }
  
}