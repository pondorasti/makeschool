from flask import Flask, request

app = Flask(__name__)

"""A sample application to demonstrate the usage of HTML forms in Flask routes."""

@app.route('/')
def home():
    """Shows the homepage."""
    return """
    <h1>Welcome to the Pizza Ordering Site!</h1> 
    <p>Please click on one of the following links.</p>

    <p><a href="/simple">Simple Ordering Form</a></p>

    <p><a href="/complex">Complex Ordering form</a></p>
    """


@app.route('/simple')
def simple_pizza_order():
    """Shows a simple order form."""
    
    # TOOD: Change the form element below to include action="/simple_results" 
    # and method="POST"

    return """
    <form action="/simple_results" method="GET">
    What's your favorite pizza flavor?
    <input type="text" name="pizza_flavor">
    <input type="submit" value="Submit">
    </form>
    """

@app.route('/simple_results', methods=['GET', 'POST'])
def simple_pizza_results():
    """Processes & shows results for a simple order form."""

    # TODO: Use `request.args.get()` to retrieve the user's pizza flavor, then 
    # include it in the response.
    pizza_flavor = request.args.get('pizza_flavor')
    return f"You ordered {pizza_flavor} pizza!"

@app.route('/complex')
def complex_pizza_order():
    """Shows a more complex pizza order form."""

    return """
    <h1>Welcome to PIZZA PIZZA ordering</h1>
    <p>We deliver your pizza in 40 minutes max. If not - Pizza's on us!</p>
    <p>Your details:</p>
    <form action="/complex_results", method="GET">
    <p>
        <label for="email">Email:</label><br>
        <input type="email" name="email" placeholder="ex: myname@example.com">
    </p>

    <p>
        <label for="area">Phone Number:</label><br>
        <input type="number" name="phone" placeholder="ex: 1112223333">
    </p>

    <p>
        <label for="crust">Crust type:</label><br>
        <select id="crust" name="crust">
            <option value="thin">Thin Crust</option>
            <option value="thick">Thick Crust</option>
            <option value="glutenfree">Gluten Free</option>
        </select>
    </p>

    <p>
        <label for="size">Pizza size:</label><br>
        <input type="radio" name="size" value="8">
        <label for="8">8 inch</label>
        <input type="radio" name="size" value="10">
        <label for="12">10 inch</label>
        <input type="radio" name="size" value="12">
        <label for="12">12 inch</label>
    <p>

    <p>
        <label for="toppings">Toppings:</label><br>
        <input type="checkbox" name="toppings" value="pineapple">
        <label for="pineapple">Pineapple</label>
        <input type="checkbox" name="toppings" value="onions">
        <label for="onions">Onions</label>
        <input type="checkbox" name="toppings" value="mushrooms">
        <label for="mushrooms">Mushrooms</label>
        <input type="checkbox" name="toppings" value="beyond_sausage">
        <label for="beyond_sausage">Beyond Sausage</label>
    </p>

    <p>
        <input type="checkbox" name="terms_conditions" value="accepted">
        <label for="terms_conditions">I agree to the terms and conditions</label>
    </p>

    </p>
    <input type="submit" value="Submit Order!">
    </p>

    </form>
    """

@app.route('/complex_results', methods=['GET', 'POST'])
def complex_pizza_results():
    """Processes & shows results for a complex pizza order form."""

    # TODO: Uncomment the following lines to see the form key/value pairs
    # print('------------------- REQUEST.ARGS -------------------------)
    # print(request.args)
    # print('----------------------------------------------------------)

    users_email = request.args.get('email')
    users_phone = request.args.get('phone')
    crust_type = request.args.get('crust')
    pizza_size = request.args.get('size')
    list_of_toppings = request.args.getlist('toppings')
    accepted_terms = request.args.get('terms_conditions')

    if accepted_terms != 'accepted':
        return 'Please accept the terms and conditions and try again!'

    return f"""
    Your order summary: <br>
    Email: {users_email} <br>
    Phone number: {users_phone} <br><br>

    You ordered a {crust_type} crust pizza of size {pizza_size}-inch
    with the following toppings: {', '.join(list_of_toppings)}
    """

if __name__ == '__main__':
    app.run(debug=True)
