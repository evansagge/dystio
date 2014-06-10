watch :s3, 'foo', bucket: 'dystio-s3-examples' do
  runner :shell do
    command ->(items) { "echo #{items['foo']} > /tmp/foo.txt" }
  end
end
