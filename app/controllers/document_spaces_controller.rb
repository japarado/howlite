class DocumentSpacesController < ApplicationController
  before_action :set_document_space, only: [:show, :edit, :update, :destroy]

  # GET /document_spaces
  # GET /document_spaces.json
  def index
    @document_spaces = current_user.faculty.document_spaces
    @document_space = DocumentSpace.new
  end

  # GET /document_spaces/1
  # GET /document_spaces/1.json
  def show
    @document_space = DocumentSpace.find(params[:id])
    @documents = Document.where(document_space_id: params[:id])
    @document = Document.new
  end

  # GET /document_spaces/new
  def new
    @document_space = DocumentSpace.new
  end

  # GET /document_spaces/1/edit
  def edit
  end

  # POST /document_spaces
  # POST /document_spaces.json
  def create

    @document_space = DocumentSpace.new(document_space_params)
    @document_space.faculty_id = current_user.faculty.id

    if @document_space.save
         redirect_to document_spaces_url, notice: document_space_params[:title]+' has been saved.'
    else
         redirect_to document_spaces_url, notice: @document_space.errors.full_messages
    end

  end

  # PATCH/PUT /document_spaces/1
  # PATCH/PUT /document_spaces/1.json
  def update
    respond_to do |format|
      if @document_space.update(document_space_params)
        format.html { redirect_to @document_space, notice: 'Document space was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_space }
      else
        format.html { render :edit }
        format.json { render json: @document_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_spaces/1
  # DELETE /document_spaces/1.json
  def destroy
    @document_space.destroy
    respond_to do |format|
      format.html { redirect_to document_spaces_url, notice: 'Document space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_space
      @document_space = DocumentSpace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_space_params
      params.fetch(:document_space, {}).permit(:title)
    end
end
