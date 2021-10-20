require 'swagger_helper'

describe 'Products API' do

  path '/products' do

    get 'Retrieves all products' do
      tags 'Products'
      produces 'application/json'

      response '200', 'product found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            product_type: { type: :string },
            description: { type: :string },
            filename: { type: :string },
            height: { type: :integer },
            width: { type: :integer },
            price: { type: :float },
            rating: { type: :integer }
          },
          required: [ 'id' ]

        let(:id) { Product.create!(title: 'Water', product_type: 'liquid', description: 'Water in a water bottle', filename: '51.jpg', height: 600, width: 400, price: 5.50, rating: 5) }
        run_test!
      end
    end
  end

  path '/products/{id}' do

    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'product found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            product_type: { type: :string },
            description: { type: :string },
            filename: { type: :string },
            height: { type: :integer },
            width: { type: :integer },
            price: { type: :float },
            rating: { type: :integer }
          },
          required: [ 'id' ]

        let(:id) { Product.create!(title: 'Water', product_type: 'liquid', description: 'Water in a water bottle', filename: '51.jpg', height: 600, width: 400, price: 5.50, rating: 5) }
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/products' do

    post 'Creates a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          product_type: { type: :string },
          description: { type: :string },
          filename: { type: :string },
          height: { type: :integer },
          width: { type: :integer },
          price: { type: :float },
          rating: { type: :integer }
        },
        required: [ 'title', 'product_type' ]
      }

      response '201', 'product created' do
        let(:product) { { title: 'Water', product_type: 'liquid', description: 'Water in a water bottle', filename: '51.jpg', height: 600, width: 400, price: 5.50, rating: 5 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'Water' } }
        run_test!
      end
    end
  end

  path '/products/{id}' do

    delete 'Delete a product' do
      tags 'Products'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Product deleted' do
        let(:id) {create(:product).id}
        run_test!
      end
    end
  end

end
