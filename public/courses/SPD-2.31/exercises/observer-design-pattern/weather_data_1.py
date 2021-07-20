""" Initial implemetation of WeatherData
"""
class WeatherData:
    def __init__(self):
        pass

    def measurementsChanged(self):
        """Notifies other part of the program that the measurements
        has been updated.
        """
        # Grab the most recent measurements by calling the WeatherData's getter
        # methods (already implemented).
        temp = getTemperature()
        humidity = getHumidity()
        pressure = getPressure()

        # Now update the display
        currentConditionsDisplay.update(temp, humidity, pressure)
        statisticsDisplay.update(temp, humidity, pressure)
        forecastDisplay.update(temp, humidity, pressure)

    # other WeatherData methods here
