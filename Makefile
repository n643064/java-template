default: clean jar run

TARGET=app.jar
BUILD=build
SOURCE=src
JAVAC=javac
JAVA=java
JAR=jar
MAIN=Main

.PHONY: clean compile jar run


clean:
	rm -rf $(BUILD)/*
	rm -f $(TARGET)

$(BUILD): 
	mkdir $(BUILD)

compile: $(BUILD)
	$(JAVAC) -d $(BUILD) $(SOURCE)/*

manifest.mf:
	echo Main-Class: $(MAIN) > manifest.mf

jar: manifest.mf compile 
	$(JAR) cfm $(TARGET) manifest.mf -C $(BUILD) .
	
run:
	$(JAVA) -jar $(TARGET)
