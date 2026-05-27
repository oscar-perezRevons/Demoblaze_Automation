module TestDictionary
  DATA = {
    urls: {
      home: 'https://www.demoblaze.com/index.html',
      cart: 'https://www.demoblaze.com/cart.html'
    },
    users: {
      revons: {
        username: 'Revons',
        password: 'Revons'
      },
      invalid_password: 'WrongPass123'
    },
    links: {
      signup: 'Sign up',
      login: 'Log in',
      logout: 'Log out',
      cart: 'Cart'
    },
    buttons: {
      signup: 'Sign up',
      login: 'Log in',
      place_order: 'Place Order',
      purchase: 'Purchase'
    },
    actions: {
      add_to_cart: 'Add to cart'
    },
    labels: {
      products: 'Products'
    },
    categories: {
      laptops: 'Laptops'
    },
    products: {
      sony_vaio_i5: 'Sony vaio i5',
      samsung_galaxy_s6: 'Samsung galaxy s6',
      nokia_lumia_1520: 'Nokia lumia 1520'
    },
    alerts: {
      user_exists: 'This user already exist.',
      fill_credentials: 'Please fill out Username and Password.',
      wrong_password: 'Wrong password.',
      signup_success: 'Sign up successful.',
      user_not_exists: 'User does not exist.',
      product_added: 'Product added'
    },
    messages: {
      welcome_revons: 'Welcome Revons',
      purchase_success: 'Thank you for your purchase!'
    },
    orders: {
      qa_name: 'QA Buyer',
      qa_country: 'Bolivia',
      qa_city: 'La Paz',
      qa_card: '4111111111111111',
      qa_month: '12',
      qa_year: '2028'
    }
  }.freeze

  module_function

  def resolve(value)
    token = value.to_s.strip
    return value.to_s unless token.start_with?('$')

    token
      .delete_prefix('$')
      .split('.')
      .map(&:to_sym)
      .reduce(DATA) { |memo, key| memo.fetch(key) }
      .to_s
  rescue KeyError
    raise "Dictionary key not found: #{token}"
  end
end
