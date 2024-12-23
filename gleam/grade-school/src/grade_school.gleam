import gleam/list
import gleam/dict.{type Dict}
import gleam/set.{type Set}
import gleam/int
import gleam/string
import gleam/option.{Some, None}

pub type School {
  School(
    grades: Dict(Int, Set(String)),
    students: Set(String))
}

pub fn create() -> School {
  School(grades: dict.new(), students: set.new())
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  let School(grades, students) = school
  case set.contains(students, student) {
    True -> Error(Nil)
    False -> {
      let update_students = set.insert(students, student)
      let update_grades = dict.upsert(grades, grade, fn(x) {
        case x {
          Some(s) -> set.insert(s, student)
          None -> set.new() |> set.insert(student)
        }
      })
      Ok(School(update_grades, update_students))
    }
  }
}

pub fn roster(school: School) -> List(String) {
  let School(grades, _) = school
  dict.keys(grades)
  |> list.sort(by: int.compare)
  |> list.map(fn(g) { grade(school, g) })
  |> list.flatten
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  let School(grades, _) = school
  case dict.get(grades, desired_grade) {
    Ok(s) ->
      set.to_list(s)
      |> list.sort(by: string.compare)
    Error(Nil) -> []
  }
}
