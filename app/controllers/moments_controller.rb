class MomentsController < ApplicationController
  # GET /moments
  # GET /moments.json
  def index
    if logged_in?
      @moments = Moment.where(:user_id => current_user.id).order('created_at DESC')
      if params[:tag].present?
        @tag = params[:tag]
        @moments = @moments.tagged_with(@tag)
      end
      if params[:type].present?
        @type = params[:type]
        moments = @moments.joins(@type.to_sym)
        if @type == 'text'
          if @tag.present?
            @moments = moments + @moments.where('url IS NULL and content IS NOT NULL').tagged_with(@tag)
          else
            @moments = moments + @moments.where('url IS NULL and content IS NOT NULL')
          end
        else
          @moments = moments
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moments }
    end
  end

  # GET /moments/1
  # GET /moments/1.json
  def show
    @moment = Moment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moment }
    end
  end

  # GET /moments/new
  # GET /moments/new.json
  def new
    @moment = Moment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moment }
    end
  end

  # GET /moments/1/edit
  def edit
    @moment = Moment.find(params[:id])
  end

  # POST /moments
  # POST /moments.json
  def create
    @moment = Moment.new(params[:moment])
    @moment.user = current_user

    respond_to do |format|
      if @moment.save
        format.html { redirect_to @moment, notice: 'Moment was successfully created.' }
        format.json { render json: @moment, status: :created, location: @moment }
      else
        format.html { render action: "new" }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moments/1
  # PUT /moments/1.json
  def update
    @moment = Moment.find(params[:id])

    respond_to do |format|
      if @moment.update_attributes(params[:moment])
        format.html { redirect_to @moment, notice: 'Moment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moments/1
  # DELETE /moments/1.json
  def destroy
    @moment = Moment.find(params[:id])
    @moment.destroy

    respond_to do |format|
      format.html { redirect_to moments_url }
      format.json { head :no_content }
    end
  end
end
