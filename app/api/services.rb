module Services
  class API < Grape::API

    prefix 'services'
    format :json

    http_basic do |username, password|
      { 'my_user' => 'my_password' }[username] == password
    end

    resource 'stores' do

      get '/' do
        store = Store.all
        {"stores" => store.as_json(:only => [:id,:address,:name]), "success" => true, "total_elements" => store.count}
      end
    end

    resource 'articles' do
      get '/' do
        articles = Article.all
        {"articles" => articles.as_json(:methods => :store_name, :only => [:id,:description,:name,:price,:total_in_shelf,:total_in_vault]), "success" => true, "total_elements" => articles.count }
      end

      get '/stores/:id' do
        if params[:id].to_i.to_s == params[:id]
          if Store.exists?(params[:id])
            store_articles = Article.find_all_by_store_id(params[:id])
            {"articles" => store_articles.as_json(:methods => :store_name, :only => [:id,:description,:name,:price,:total_in_shelf,:total_in_vault]), "success" => true, "total_elements" => store_articles.count }
          else
            {"success" => false,"error_code" => 404, "error_msg"=> "Record not found"}
          end
        else
          {"success" => false,"error_code" => 400, "error_msg" => "Bad request"}
        end

      end
    end

  end
end