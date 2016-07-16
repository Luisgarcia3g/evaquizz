class Scripts::UpdateGroups
  include Service

  def initialize()
  end

  def call
    # create non-erasable folders for lessons and side-quests
    params = { 'criteria[0][key]' => 'courseid', 'criteria[0][value]' => '%%' }
    @courses = Moodle::Api.core_enrol_get_enrolled_users(params)
    @cantidadcursos = @courses.length
    @cursos = Array.new
    Array.new(@cantidadcursos)
    @cursosid = Array.new
    Array.new(@cantidadcursos)

    for i in 0..@cantidadcursos-1
      @cursos[i] = @courses[i].values[0]
    end

    for i in 0..@cantidadcursos-1
      @grupo=Grupo.whwere(Nombre_grupo: @courses[i]["shortname"])
      if (@grupo.exist?)
        
      else
      grupo = Grupo.create(Nombre_grupo: @courses[i]["shortname"])

    end

    end
    # Resource.all.each do |resource|
    #   resource.resource_assets.create(uploaded_file: resource.uploaded_file, is_for_teacher: false)
    # end
  end

end
