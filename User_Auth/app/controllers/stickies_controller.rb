class StickiesController < ApplicationController
  before_action :set_sticky, only: [:show, :edit, :update, :destroy]

  # GET /stickies
  # GET /stickies.json
  def index
    @stickies = Sticky.all
  end

  # GET /stickies/1
  # GET /stickies/1.json
  def show
    # render 'form'
  end

  # GET /stickies/new
  def new
    @sticky = Sticky.new
  end

  # GET /stickies/1/edit
  def edit
    puts 'eeeeeeee'
  end

  # POST /stickies
  # POST /stickies.json
  def form
    @sticky = Sticky.new(sticky_params)
    puts "--------------------------------"
    @sticky['users_id'] = 1;
    puts @sticky.users_id
    puts "------------------------------"+@sticky.title+@sticky.content

    # respond_to do |format|
      if @sticky.save
      #   format.html do
      #     redirect_to @sticky, notice: 'Sticky was successfully created.'
      #   end
      #   format.json { render :show, status: :created, location: @sticky }
        render 'stickies/show'
      else
        render 'stickies_form_path'
        # format.html { render :new }
        # format.json { render json: @sticky.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /stickies/1
  # PATCH/PUT /stickies/1.json
  def update
    respond_to do |format|
      if @sticky.update(sticky_params)
        format.html { redirect_to @sticky, notice: 'Sticky was successfully updated.' }
        format.json { render :show, status: :ok, location: @sticky }
      else
        format.html { render :edit }
        format.json { render json: @sticky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stickies/1
  # DELETE /stickies/1.json
  def destroy
    @sticky.destroy
    respond_to do |format|
      format.html { redirect_to stickies_url, notice: 'Sticky was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rout
    render 'form'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sticky
      @sticky = Sticky.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sticky_params
      params.require(:sticky).permit(:title,:users_id, :content)
    end
end
