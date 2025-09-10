(ns day-19-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-19 :refer [part1 part2]]))

(deftest day-19-test
  (testing "sample data"
    (is (= 0 (part1 "../data/19-sample.txt")))
    (is (= 0 (part2 "../data/19-sample.txt")))))
