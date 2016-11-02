# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Class notes

// NEW VS BUILD
	def new
		@order = Order.new
		@order.user = current_user
	end

	def new
		@order = current_user.orders.build
	end

// build is an alias for new

// FIND

	def show
		@order = Order.find(params[:id])
		if @order.user != current_user


	def show
		@order = current_user.orders.find(params[:id])
	end

// FIND_BY

	Order.find(1) ===>>> ActiveRecord:notfound
	Order.find_by_id(1) ====>>> nil

	So when we put in shopping cart, we have to use find_by, because even if shopping cart doesn't exist it would return "nil"
	Otherwise if we use find(id), it would be NotFound and user would see an error page.

// FIND BY TOKEN

	order = Order.find_by_token("xxx")

	IS THE SAME AS

	order = Order.where(:token = "xxx").first

	IF WE USE
	order = Order.where(:token = "xxx") IS EMPTY, IT WILL RETURN []

	IF WE DO

	if @order nil => false
	if @order [] => []

	so

	if @order.blank?

	"", nil, []


// ! vs ?

	!current_user (if current_user doesn't exist)
	current_user != user (does not equal)

	! is to FORCE change of something, sometimes certain methods (like downcase), doesn't change the permanently.
	So placing ! after an action definition would tell the reviewer or collaborator that something here is changing for certain.

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

// why not @user.save!, because if validate the statement, might break the code

*big* is the _next_ **this is bold**
