project_details = { status: "ongoing" }
projects = []

def projects.[]=(*args, **keyword_args)
  puts "args: #{args}"
  puts "keyword_args: #{keyword_args}"
end

projects[1, status: "completed"], _ = ["Project A updated", "Project B"]

projects[2, **project_details], _ = [{budget: 10000}, "Project C"]
