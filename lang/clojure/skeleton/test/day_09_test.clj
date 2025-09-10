(ns day-09-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-09 :refer [part1 part2]]))

(deftest day-09-test
  (testing "sample data"
    (is (= 0 (part1 "../data/09-sample.txt")))
    (is (= 0 (part2 "../data/09-sample.txt")))))
