module StudentDataHelper
  def chart_tag (action, height, params = {})
    params[:format] ||= :json
    path = student_data_path(action, params)
    content_tag(:div, :'data-chart' => path, :style => "height: #{height}px;") do
      image_tag('rails.png', :size => '36x48')
    end
  end
end