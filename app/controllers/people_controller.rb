class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    authenticate
    @people = Person.all.reverse_order;
    #@people = Person.order("name ASC").all;
    #@people = Person.where('name LIKE ?', '%melikian%').all
  end

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username,password|
      username == 'REDACTED' && password == 'REDACTED'
    end
  end

  def kioskIndex
    system("killall matchbox-keyboard");
    numPerPage = 12
    unless !params[:search].present?
      searchString = params[:search].downcase.strip.gsub(/[^a-z ]/i, '').gsub(' ', '%');
      searchString = '%' + searchString + "%"
      search = Person.where('name LIKE ?', searchString).order("name ASC")
      @totalPages = (search.count.to_f / numPerPage.to_f).ceil
      if !params[:page].present?
        @currentPage = 1
        @people = search.limit(numPerPage)
      else
        @currentPage = params[:page].to_i + 1
        @people = Person.where('name LIKE ?', searchString).order("name ASC").limit(numPerPage).offset(params[:page].to_i*numPerPage);
      end
    else
      search = Person.order("name ASC");
      @totalPages = (search.count / numPerPage).ceil
      if !params[:page].present?
        @currentPage = 1
        @people = search.limit(numPerPage);
      else
        @currentPage = params[:page].to_i + 1
        @people = search.limit(numPerPage).offset((params[:page].to_i)*numPerPage);
      end
    end

  end

  def kioskPeople
    @person = Person.find(params[:id]);
    render layout: false;
  end

  def openKeyboard
    system("sudo -u pi matchbox-keyboard -f arial &");
  end

  def closeKeyboard
    system("killall matchbox-keyboard");
  end

  # GET /people/1
  # GET /people/1.json
  def show
    authenticate
  end

  # GET /people/new
  def new
    authenticate
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    authenticate
  end

  def updateBackup
    system("REDACTED");
    system("REDACTED");
  end

  # POST /people
  # POST /people.json
  def create
    authenticate
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to admin_showPerson_url(@person), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
    updateBackup
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    authenticate
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to admin_showPerson_url(@person), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
    updateBackup
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    authenticate
    @person.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
    updateBackup
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :birthdate, :birthplace, :deathdate, :deathplace, :story, :image)
    end
end
