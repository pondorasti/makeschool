# Design Patterns - Observer Pattern
This repo contains the relevant files from the   
 [Weather Challenge [Google Doc] ](https://docs.google.com/document/d/1KsxwtoQ-R4H1HBObjIGqJizBcPoNhYBYcYHKMUthqV8/view)

 Please read and follow along with the steps listed there for more information on how to use these files. 

# TODO

## Initial Implementation 
```python
    class WeatherData:
    def __init__(self):
        pass

    def measurementsChanged(self):
        """Notifies other part of the program that the measurements has been updated.
        """
        # Grab the most recent measurements by calling the WeatherData's getter
        # methods (already implemented).
        temp = getTemperature()
        humidity = getHumidity()
        pressure = getPressure()

        # Now update the display
        currentConditionsDisplay.update(temp, humidity, pressure)
        statisticsDisplay.update(temp, humidity, pressure)
        forcastDisplay.update(temp, humidity, pressure)

    # other WeatherData methods here
```

### Check For Understanding
Based on our first implementation `weather_data1.py`, which of the following apply? (Choose all that apply.)

[ ] A. We are coding to concrete implementations, not interfaces.  
[ ] B. For every new display we’ll need to alter this code.  
[ ] C. We have no way to add (or remove) display elements at runtime.  
[ ] D. The display elements don’t implement a common interface.  
[ ] E. We haven’t encapsulated the part that changes.  
[ ] F. We are violating encapsulation of the WeatherData class.  

## Final Implementation
The following code [weather_station.py](weather_station.py) is the final implementation of the system. Run it to see how it works. Then implement the TODO sections. Run again and make sure it’s working. At the end submit the code to the Gradescope assignment “The Observer Design Pattern”.
