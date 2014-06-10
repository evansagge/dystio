watch :s3, 'foo', bucket: 'dystio-s3-examples' do
  runner :template do
    source 'simple_template.erb'
    destination '/tmp/foo.txt'
  end
end
