(ns day-14-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-14 :refer [part1 part2]]))

(deftest day-14-test
  (testing "sample data"
    (is (= 0 (part1 "../data/14-sample.txt")))
    (is (= 0 (part2 "../data/14-sample.txt")))))
